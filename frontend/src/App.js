import React, { Component } from 'react';
import { HashRouter, Route, Redirect } from 'react-router-dom';
import axios from 'axios';

import Header from './components/Header';
import Home from './containers/Home';
import Login from './containers/Login';
import Logout from './containers/Logout';
import Signup from './containers/Signup';
import Profile from './containers/Profile';
import firebase from '../src/firebase'

class App extends Component {
  constructor() {
    super()
    this.state = {
      user: null
    }
  }

  setCurrentUser = user => {
    this.setState({
      user: user
    })
  }
  // componentDidMount() {
  //   console.log('localhost in app.js ', localStorage)
  // }
  // getLoggedinUser = () => {
  //   axios.get()
  // }

  handleLoginUser = () => {
    const {user} = this.state
    if (user) {
      // if the user is logged in I will re route them to their profile component
      return <Redirect to='/home' />
    } else {
      return <Login setCurrentUser={this.setCurrentUser} />
    }
  }

  handleRegisterUser = () => {
    const {user} = this.state
    console.log('this is the user in app.js registering a new one ', user)

    if(user) {
      return <Redirect to='/home' />
    } else {
      return <Signup setCurrentUser={this.setCurrentUser} />
    }
  }

  render() {
    return (
      <HashRouter>
          <Header/>
          <div className="main-container">
          <Route path="/home" exact component={Home}/>
          <Route path="/signup" exact component={this.handleRegisterUser} />
          <Route path="/login" exact component={this.handleLoginUser} />
          <Route path="/logout" exact component={Logout} />
          <Route path="/profile" exact component={Profile}/>
        </div>
      </HashRouter>
    );
  }
}

export default App;
