import React, { Component } from 'react';
import { HashRouter, Route } from 'react-router-dom';
import axios from 'axios';
import Header from './components/Header';
import Home from './containers/Home';
import Login from './containers/Login';
import Logout from './containers/Logout';
import Signup from './containers/Signup';
import Dashboard from './containers/Dashboard';


class App extends Component {

  // getLoggedinUser = () => {
  //   axios.get()
  // }

  render() {
    return (
      <HashRouter>
          <Header/>
          <div className="main-container">
          <Route path="/" exact component={Home}/>
          <Route path="/signup" exact component={Signup} />
          <Route path="/login" exact component={Login} />
          <Route path="/logout" exact component={Logout} />
          <Route path="/dashboard" exact component={Dashboard}/>
        </div>
      </HashRouter>
    );
  }
}

export default App;
