import React from "react";
import PropTypes from "prop-types";

class Avatar extends React.Component {
  render() {
    const size = {
      "xs": "1rem",
      "sm": "2rem",
      "md": "4rem",
      "lg": "6rem",
      "xl": "8rem"
    };

    return (
      <span className="avatar" style={{backgroundImage: `url(${this.props.src})`}}>
        <style jsx>{`
          span.avatar {
            width: ${size[this.props.size || "sm"]};
            height: ${size[this.props.size || "sm"]};
            line-height: ${size[this.props.size || "sm"]};
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

Avatar.propTypes = {
  src: PropTypes.string.isRequired,
  size: PropTypes.string
};

export default Avatar;