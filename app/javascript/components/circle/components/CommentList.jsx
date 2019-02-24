import React from "react";
import PropTypes from "prop-types";
import { WingBlank, WhiteSpace } from "antd-mobile";

class CommentList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (

      <WingBlank>
        <div className="comments-list">
          {
            this.props.comments.map((comment) => (
              <div key={comment.id}>
                <span className="author">{comment.author.name}: </span>
                <span>{comment.content}</span>
              </div>
            ))
          }
          <style jsx>{`
            div {
              font-size: 0.8rem;
              line-height: 1.1rem;
              padding: 0.25rem 0;
            }

            div.comments-list {
              background: #efefef;
              padding: 0.5rem;
            }

            div .author {
              color: rgb(51, 163, 244);
            }
          `}</style>
        </div>
        <WhiteSpace size="xl"/>
      </WingBlank>
    );
  }
}

CommentList.propTypes = {
  comments: PropTypes.array
};

export default CommentList;