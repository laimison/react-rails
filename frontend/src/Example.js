import React, { Component } from 'react';

class Example extends Component {
  constructor() {
    super();
    this.state = {
        text: 'Example component imported successfully.'
    };
  }
  render() {
    return (
        <div className="app">
            {this.state.text}
        </div>
    );
  }
}

export default Example;
