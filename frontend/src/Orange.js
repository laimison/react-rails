import React, { Component } from 'react';
import './Orange.css';

class Orange extends Component {
  render() {
    return (
      <div>
        <p>
          the proof is {this.props.desc}
        </p>
      </div>
    );
  }
}

export default Orange;
