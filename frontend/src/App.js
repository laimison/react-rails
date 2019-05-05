import React, { Component } from 'react';
import "../node_modules/react-image-gallery/styles/css/image-gallery.css";
import ImageGallery from 'react-image-gallery';
import Modal from 'react-responsive-modal';
// import './modal.css';

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
        original: 'http://localhost:4000/1000x600.jpeg',
        thumbnail: 'http://localhost:4000/250x150.jpeg',
      },
      {
        original: 'http://localhost:4000/1000x600.jpeg',
        thumbnail: 'http://localhost:4000/250x150.jpeg',
      },
      {
        original: 'http://localhost:4000/1000x600.jpeg',
        thumbnail: 'http://localhost:4000/250x150.jpeg',
      },
      {
        original: 'http://localhost:4000/1000x600.jpeg',
        thumbnail: 'http://localhost:4000/250x150.jpeg',
      },
      {
        original: 'http://localhost:4000/1000x600.jpeg',
        thumbnail: 'http://localhost:4000/250x150.jpeg',
      },
      {
        original: 'http://localhost:4000/1000x600.jpeg',
        thumbnail: 'http://localhost:4000/250x150.jpeg',
      }
    ]
    return (
      <div>
        {/*
        <button onClick={this.onOpenModal}>Open Second Photo</button>
        */}
        <Modal open={open} onClose={this.onCloseModal}>
          {/*
          <h2>Simple centered modal</h2>

          Inspired by https://stackoverflow.com/questions/51263480/react-current-image-in-image-gallery

          <ImageGallery
            key={this.state.number}
            items={this.state.data.images}
            startIndex={this.state.currentImage}
            slideInterval={2000}
            showPlayButton={false}
            showFullscreenButton={false}
            onImageLoad={this.handleImageLoad}
            onSlide={this._onSlide}
            showIndex={true}
            renderItem={this._renderImages}
          />
          */}

        </Modal>
        {/*

        */}
        <ImageGallery startIndex={1} items={images} />
      </div>
    );
  }
}
