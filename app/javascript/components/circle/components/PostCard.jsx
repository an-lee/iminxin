import React from "react";
import PropTypes from "prop-types";
import renderHTML from "react-render-html";
import Avatar from "./Avatar";
import { Modal } from "antd-mobile";
import { ThumbsUp, MessageSquare, MoreHorizontal } from "react-feather";

class PostCard extends React.Component {
  onMore = () => {
    let operations = [
      { text: "点赞", onPress: this.onLike},
      { text: "回复", onPress: this.onComment}
    ];
    if (this.props.post.can_edit) {
      operations.push({ text: "删除", onPress: this.onDelete});
    }
    Modal.operation(operations);
  }

  onLike = () => {
    // console.log("like!");
  }

  onComment = () => {
    // console.log("comment!");
  }

  onDelete = () => {
    // console.log("delete!");
  }
  
  render() {
    const post = this.props.post;

    return (
      <div>
        <div className="post-card">
          <div className="post-card-body">
            <Avatar src={post.author.avatar_url}/>
            <div className="post-content">
              <div className="post-info">
                <div className="post-info-author">{post.author.name}</div>
                <div className="post-info-created-at">{post.created_at}</div>
                <div className="post-info-more" onClick={this.onMore}><MoreHorizontal size={18}/></div>
              </div>
              {renderHTML(post.content)}
            </div>
          </div>
          <div className="post-card-footer">
            <div className="post-action" onClick={this.onLike}>
              {
                post.liked ?
                  <ThumbsUp color="#467fcf" size={16} />
                  :
                  <ThumbsUp size={16}/>
              }
            </div>
            <div className="post-action" onClick={this.onComment}>
              {
                post.commented ?
                  <MessageSquare color="#467fcf" size={16}/>
                  :
                  <MessageSquare size={16}/>
              }
            </div>
          </div>
        </div>
        <style jsx global>{`
          .post-card {
            background-color: white;
            padding: 0.75rem 0.75rem 0;
            margin-bottom: 1rem;
          }

          .post-card p {
            margin: 0.5rem 0;
          }

          .post-card .post-card-body {
            display: flex;
            align-item: start;
          }

          .post-card .post-card-footer {
            border-top: 1px solid #f4f4f4;
            display: flex;
          }

          .post-card .post-info {
            display: flex;
            align-items: center;
          }

          .post-card .post-info .post-info-author {
            font-size: 1rem;
            flex: 1;
          }

          .post-card .post-info .post-info-created-at {
            font-size: 0.75rem;
            color: #9aa0ac;
          }

          .post-info-more {
            margin: 0 1rem;
          }

          .post-card .post-card-footer .post-action {
            flex: 1;
            text-align: center;
            padding: 0.5rem 0;
          }

          .post-card .post-content {
            flex: 1;
          }

          .post-card .avatar {
            margin-right: 0.5rem;
          }
        `}</style>
      </div>
    );
  }
}

PostCard.propTypes = {
  post: PropTypes.object,
  me: PropTypes.object
};

export default PostCard;