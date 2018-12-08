import React, { Component } from 'react';
import MyForm from './MyForm';
import Example from './Example';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }
  render() {
    return (
      <div>
        <MyForm />
        <Example />
      </div>
    );
  }
}

export default App;
