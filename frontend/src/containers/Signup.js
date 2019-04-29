/*
1) This component has an input form that accepts a username, fullname, email and password.

2) With a handle submit function I am validating the user through firebase and then setting the registered user to the state, and then sending a POST request where I add that new user to my postGres tables. 

3) Lastly inside of componentDidMount I am setting my localStorage to the firebase auth_token that will change with every new logged in session and delete after the user is logged out. 
*/

import React from 'react';
import firebase from '../firebase'
import axios from 'axios';


class Signup extends React.Component {
    constructor() {
        super()
        this.state = {
            user: {},
            displayName: '',
            fullname: '',
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
        const { email, password, displayName, fullname } = this.state
        // This request validates the user via firebase and sets to state the user returned
        firebase.auth().createUserWithEmailAndPassword(email, password)
            .then((res) => {
                this.setState({
                    user: {
                        username: displayName,
                        email: res.user.email,
                        uid: res.user.uid,
                    }
                })
                return res
            })
            // This request POSTS the new user to the user table
            .then((res) => {
                axios.post('/users/addnewuser', {
                    username: displayName,
                    fullname: fullname, 
                    email: res.user.email,
                    firebase_uid: res.user.uid
                })
                .then((res) => {
                    console.log('res success post request on Sign up! ')
                    // Passing the user as props back to App.js
                    this.props.setCurrentUser(res.data.data[0])
                })
                .catch(err => {
                    console.log('Couldnt make a POST request ', err)
                })
            })
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
        const { email, password, message, displayName, fullname } = this.state

            return (
                <div>
                    <h1>Sign Up</h1>
                    <div className="signup-form">
                        <label>Username:</label>
                        <input type="displayName" placeholder="Enter username" name="displayName" value={displayName} onChange={this.handleChange} />

                        <label>Full Name:</label>
                        <input type="fullname" placeholder="enter full name" name="fullname" value={fullname} onChange={this.handleChange} />

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


export default Signup