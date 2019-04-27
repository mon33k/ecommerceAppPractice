import React from 'react';
import firebase from '../firebase';
import LoginError from './LoginError';
import Header from '../components/Header';
import Dashboard from '../containers/Dashboard';
import { Redirect } from 'react-router-dom';
import axios from 'axios';

class Login extends React.Component {
    constructor() {
        super()
        this.state = {
            user: {},
            displayName: '',
            email: '',
            password: '',
            id: '',
            message: ''
        }
    }

    handleChange = (e) => {
        this.setState({
            [e.target.name]: e.target.value
        })
    }

    handleSubmit = (e) => {
        e.preventDefault()
        const { email, password, displayName } = this.state

        firebase.auth().signInWithEmailAndPassword(email, password)
        .then((res) => {
                // console.log('response', res, res.user.email, res.user.uid, displayName)
                let currentUserInfo = {
                    username: displayName,
                    email: res.user.email,
                    uid: res.user.uid,
                }
                this.setState({
                    user: currentUserInfo
                })
                return res
            })
        // Was trying to use something to validate a user that is logged in
        // .then((res) => {
        //     axios.get("/users/login", {
        //         username: displayName,
        //         email: res.user.email,
        //         firebase_uid: res.user.uid,
        //     })
        //     .then((res) => {
        //         console.log('User posted in db success ', res.user)
        //     })
        //     .catch(err => {
        //         console.log('error in post req ', err)
        //     })
        // })
            .catch(err => {
                this.setState({
                    message: err.message
                })
            })
    }


    componentDidMount() {
        this.unsubscribe = firebase.auth().onAuthStateChanged((user) => {
            if (user) {
                //do loggedin logic
                this.getFirebaseToken()
            } else {
                // the user is logged out
            }
        })
    }

    componentWillUnmount() {
        this.unsubscribe()
    }

    getFirebaseToken = () => {
        firebase.auth().currentUser.getIdToken(false)
            .then((token) => {
                return localStorage.setItem('auth_token', JSON.stringify(token))
            })
    }

    render() {
        const { email, password, message, displayName, user } = this.state

        if (user.email) {
            return (<Dashboard user={user} />)
        } else {
            return (
                <div>
                    <h1>Log In</h1>
                    <div className="signup-form">
                        <label>Username:</label>
                        <input type="displayName" placeholder="Enter username" name="displayName" value={displayName} onChange={this.handleChange} />

                        <label>Email:</label>
                        <input placeholder="Enter email" name="email" value={email} onChange={this.handleChange} />

                        <label>Password: </label>
                        <input placeholder="Enter password" name="password" value={password} onChange={this.handleChange} />

                        <button onClick={this.handleSubmit}>Submit</button>
                    </div>
                    <br />
                    {message ? <div>{message}</div> : ""}
                </div>
            )
        }
    }
}

export default Login;


// return (currentUser ? (<Redirect to={{
//     pathname: "/dashboard",
//     state: { currentUser: [currentUser.user_email] }
// }}
// />) : '')