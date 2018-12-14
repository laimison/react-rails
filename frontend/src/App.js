import React, { Component } from "react";
import Slider from "react-slick";
import "./index.css";

export default class App extends Component {
  render() {
    const settings = {
      dots: false,
      infinite: true,
      speed: 700,
      slidesToShow: 3,
      slidesToScroll: 1
    };
    return (
      <div className="container">
         <Slider {...settings}>
           <div>
             <a href="https://www.google.com/search?q=1&tbm=isch">
               <img src="http://placekitten.com/g/400/200" />
             </a>
           </div>
           <div>
             <a href="https://www.google.com/search?q=2&tbm=isch">
               <img src="http://placekitten.com/g/400/200" />
             </a>
           </div>
           <div>
             <a href="https://www.google.com/search?q=3&tbm=isch">
               <img src="http://placekitten.com/g/400/200" />
             </a>
           </div>
           <div>
             <a href="https://www.google.com/search?q=4&tbm=isch">
               <img src="http://placekitten.com/g/400/200" />
             </a>
           </div>
         </Slider>
       </div>
    );
  }
}
