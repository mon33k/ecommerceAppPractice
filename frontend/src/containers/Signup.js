import React from 'react';
import firebase from '../firebase'
import Profile from './Profile'
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
        // This request validates the user via firebase
        firebase.auth().createUserWithEmailAndPassword(email, password)
            .then((res) => {
                // console.log('response', res, res.user.email, res.user.uid, displayName)
                this.setState({
                    user: {
                        username: displayName,
                        email: res.user.email,
                        uid: res.user.uid,
                    }
                })
                this.props.setCurrentUser(this.state.user)

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
                    console.log('res success post request! ', res.data)

                    // let currentUser = res.data[0]
                    // this.props.setCurrentUser(currentUser)
                    //This gave me a memory leak error and I don't know why 
                    // this.setState({
                    //     message: "user logged in success"
                    // })
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

        // let user = firebase.auth().currentUser

        // console.log('userrr', user)
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
        // let user = firebase.auth().currentUser
        // if (user !== null) {
        //     //Adding username
        //     user.updateProfile({
        //         displayName: this.state.displayName
        //     })
        //     //Adding current user info
        //     user.providerData.forEach((user) => {
        //         this.setState({
        //             currentUser: {
        //                 username: user.displayName,
        //                 user_email: user.email,
        //                 user_uid: user.uid
        //             }
        //         })
        //     })

    }



    render() {
        const { email, password, message, displayName, user, fullname } = this.state

        // if (user.email) {
        //     return (<Profile user={user} />)
        // } else {
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
        // }
    }
}


export default Signup