import React, { Component } from 'react';
import "../node_modules/react-image-gallery/styles/css/image-gallery.css";
import ImageGallery from 'react-image-gallery';
import Modal from 'react-responsive-modal';

export default class App extends Component {
  state = {
    open: false,
  };
 
  onOpenModal = () => {
    this.setState({ open: true });
  };
 
  onCloseModal = () => {
    this.setState({ open: false });
  };
   
  render() {
    const { open } = this.state;

    const images = [
      {
        original: 'http://localhost:5000/1000x600.jpeg',
        thumbnail: 'http://localhost:5000/250x150.jpeg',
      },
      {
        original: 'http://localhost:5000/1000x600.jpeg',
        thumbnail: 'http://localhost:5000/250x150.jpeg',
      },
      {
        original: 'http://localhost:5000/1000x600.jpeg',
        thumbnail: 'http://localhost:5000/250x150.jpeg',
      },
      {
        original: 'http://localhost:5000/1000x600.jpeg',
        thumbnail: 'http://localhost:5000/250x150.jpeg',
      },
      {
        original: 'http://localhost:5000/1000x600.jpeg',
        thumbnail: 'http://localhost:5000/250x150.jpeg',
      },
      {
        original: 'http://localhost:5000/1000x600.jpeg',
        thumbnail: 'http://localhost:5000/250x150.jpeg',
      }
    ]
    return (
      <div>
        <button onClick={this.onOpenModal}>Open First Photo</button>
        <Modal open={open} onClose={this.onCloseModal} center>
          {/*
          <h2>Simple centered modal</h2>
          */}
          <ImageGallery items={images} />
        </Modal>
        {/*
        
        */}
      </div>
    );
  }
}