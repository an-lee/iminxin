import React from "react";
import PropTypes from "prop-types";

class Logo extends React.Component {
  render() {
    const size = {
      "xs": "1rem",
      "sm": "2rem",
      "md": "4rem",
      "lg": "6rem",
      "xl": "8rem"
    };
    return (
      <span className="logo" style={{backgroundImage: `url(${this.props.src})`}}>
        <style jsx>{`
          span.logo {
            width: ${size[this.props.size || "md"]};
            height: ${size[this.props.size || "md"]};
            line-height: ${size[this.props.size || "md"]};
            border-radius: 50%;
            display: inline-block;
            background: #ced4da no-repeat center/cover;
            position: relative;
            text-align: center;
            color: #868e96;
            font-weight: 600;
            vertical-align: bottom;
            font-size: .875rem;
            user-select: none;
          }
        `}</style>
      </span>
    );
  }
}

Logo.propTypes = {
  src: PropTypes.string.isRequired,
  size: PropTypes.string
};

export default Logo;