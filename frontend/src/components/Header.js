import React from 'react';
import { Link } from 'react-router-dom'
import '../stylesheets/header.css'

const Header = () => {
        // console.log('localStorage', localStorage.auth_token)
    // console.log('currentUser in header', props.user)
        // if (user) {
        //     return (
        //         <div className="navbar-main-container">
        //             <li>Home Logo</li>
        //             <nav className="navbar-nested-container">
        //                 <li><Link to="/">Home</Link></li>
        //                 <li><Link to="/login">Login</Link></li>
        //                 <li><Link to="/logout">Logout</Link></li>
        //                 <li><Link to="/dashboard">Dashboard</Link></li>
        //             </nav>
        //         </div>
        //     )
        // } else {
            return (
                <div className="navbar-main-container">
                    <li>Home Logo</li>
                    <nav className="navbar-nested-container">
                        <li><Link to="/">Home</Link></li>
                        <li><Link to="/signup">Sign Up</Link></li>
                        <li><Link to="/login">Login</Link></li>
                        <li><Link to="/logout">Logout</Link></li>
                    </nav>
                </div>
            )
            
        // }
}

export default Header;