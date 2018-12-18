// react-slick
import React, { Component } from "react";
import Slider from "react-slick";
import "./index.css";

export default class App extends Component {
  render() {
    var settings = {
      dots: true,
      infinite: false,
      speed: 500,
      slidesToShow: 4,
      slidesToScroll: 4,
      initialSlide: 0,
      responsive: [
        {
          breakpoint: 1500,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 3,
            infinite: true,
            dots: true
          }
        },
        {
          breakpoint: 1000,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2,
            initialSlide: 2
          }
        },
        {
          breakpoint: 500,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
    };

    return (
      <div>
        <div className="container">
           <Slider {...settings}>
             <div>
               <a href="https://www.google.com/search?q=1&tbm=isch">
                 <img src="http://localhost:5000/400x200.jpeg" />
               </a>
             </div>
             <div>
               <a href="https://www.google.com/search?q=2&tbm=isch">
                 <img src="http://localhost:5000/400x200.jpeg" />
               </a>
             </div>
             <div>
               <a href="https://www.google.com/search?q=3&tbm=isch">
                 <img src="http://localhost:5000/400x200.jpeg" />
               </a>
             </div>
             <div>
               <a href="https://www.google.com/search?q=4&tbm=isch">
                 <img src="http://localhost:5000/400x200.jpeg" />
               </a>
             </div>
           </Slider>
         </div>
       </div>
    );
  }
}
