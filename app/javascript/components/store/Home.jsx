import React from "react"
import PropTypes from "prop-types"
import { Carousel } from 'element-react';
import 'element-theme-default';

class Home extends React.Component {
  render () {
    return (
      <div className="block">
        <Carousel indicatorPosition="outside">
          {
            [1,2,3,4].map((item, index) => {
              return (
                <Carousel.Item key={index}>
                  <h3>{item}</h3>
                </Carousel.Item>
              )
            })
          }
        </Carousel>
      </div>
    );
  }
}

export default Home
