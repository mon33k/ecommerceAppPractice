import React from 'react';
import firebase from '../firebase'

const Logout = () =>{
    // Clearing local storage auth_token
    localStorage.clear();
    // Signing out the current user
    firebase.auth().signOut()

        console.log('localStorage Should be clear', localStorage)
        return(
            <div>
                <h1>Logging out...</h1>
            </div>
        )
    
    
}

export default Logout