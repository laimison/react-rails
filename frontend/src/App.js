import React, { Component } from 'react';
import "../node_modules/react-image-gallery/styles/css/image-gallery.css";
import ImageGallery from 'react-image-gallery';

class App extends Component {
  render() {
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
        <ImageGallery items={images} />
      </div>
    );
  }
}

export default App;
