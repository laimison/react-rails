import React, { Component } from 'react';
//import logo from './logo.svg';
import './App.css';

import Orange from './Orange.js';

class App extends Component {
  render() {
    let bpm = 100;
    return (
      <div className="App">
        <header className="App-header">
          {/*<img src={logo} className="App-logo" alt="logo" />*/}
          <p>
            SPEEEEEED: {bpm} , but that is nowhere near me | Edit src/App.js click ok to ok.~~~~~~lasfaslfkjuhgiguigiyug  did nothing wrong~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          </p>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
          <p> assfasf</p>
          <p> asffs</p>
          {/*under here: <p> thingy with var name*/}
          <Orange desc = "trivial"/>
          <Orange desc = "apperent"/>
          <Orange desc = "simple, but you are just stupid"/>
          <Orange/>
        </header>
      </div>
    );
  }
}

export default App;
