import React from 'react';
import firebase from '../firebase';
import axios from 'axios';
import Header from '../components/Header';

//Here you have access to the current token of the user, at this point you can decrypt it from the backend or you can just save the uid. For the function to decrypt the user token you can validate the current user by decrypting the token on any component. To distinguish between a logged in user and other users. 

class Dashboard extends React.Component {
    constructor(props) {
        super(props)
        this.state = {

        }
    }

    passUserToHeader = () => {
        // console.log('this.props.user', this.props.user)
        const { user } = this.props
        console.log('user', user)
        return (
            <Header user={user} />
        )
    }

    componentDidMount() {
        this.passUserToHeader()
        // const {user} = this.props
        // console.log('user', user)
        // return (
        //     <Header user={user}/>
        // )
    }

    // if(localStorage.auth_token) {
    //     axios.get(`users/auth/${username}`)
    //         .then(data => {
    //             console.log(data)
    //         })
    //         .catch(err => {
    //             console.log(err)
    //         })
    // }


    render() {
        // console.log('localStorage', localStorage)
        // console.log('currentUser in dashboard', this.props.user)
        return (
            <div>
                DASHBOARD PAGE
            </div>
        )
    }
}


export default Dashboard