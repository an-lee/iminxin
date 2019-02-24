import React from "react";
import PropTypes from "prop-types";
import renderHTML from "react-render-html";
import Avatar from "./Avatar";
import { Modal, TextareaItem, WingBlank, Button, WhiteSpace, Toast } from "antd-mobile";
import { ThumbsUp, MessageSquare, MoreHorizontal } from "react-feather";
import api from "../libs/api";
import CommentList from "./CommentList";

class PostCard extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      comment: {
        show: false,
        content: ""
      },
      ui: {
        submiting: false
      }
    };
    api.baseUrl = this.props.base_url;
  }

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
    const comment = this.state.comment;
    comment.show = !comment.show;
    this.setState({ comment });
  }

  onCommentChange = (content) => {
    const comment = this.state.comment;
    comment.content = content;
    this.setState({ comment });
  }

  onCommentSubmit = () => {
    if (this.state.ui.submiting) return;

    const post = this.props.post;
    this.updateUI({submiting: true});
    Toast.loading("正在提交", 0);
    api.createComment({
      postId: post.id,
      data: {
        content: this.state.comment.content
      },
      fail: () => {
        Toast.fail("出错了，请稍后重试", 1);
      },
      success: (res) => {
        this.setState({
          comment: {
            show: false,
            content: ""
          }
        });
        this.props.updatePostComments(post.id, res.data.comments);
        Toast.success("成功发布", 1);
      },
      complete: () => {
        this.updateUI({submiting: false});
      }
    });
  }

  updateUI = (ui) => {
    this.setState({
      ui: Object.assign({}, this.state.ui, ui)
    });
  }

  onDelete = () => {
    // console.log("delete!");
  }
  
  render() {
    const post = this.props.post;
    const comment = this.state.comment;

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
          {
            comment.show && 
              <WingBlank style={{textAlign: "right"}}>
                <TextareaItem
                  rows={2}
                  value={comment.content}
                  onChange={this.onCommentChange}
                  autoHeight
                  name="回复"
                  placeholder={`回复${post.author.name}:`}
                />
                <Button 
                  type="primary" 
                  size="small" 
                  inline 
                  onClick={this.onCommentSubmit} 
                  disabled={!comment.content}
                >确认</Button>
                <WhiteSpace />
              </WingBlank>
          }
          {
            post.comments.length > 0 &&
            <CommentList comments={post.comments} />
          }
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
            color: ${post.is_owner ? "#fd9644" : "#49505E"}
          }

          .post-card .post-info .post-info-created-at {
            font-size: 0.75rem;
            color: #9aa0ac;
          }

          .post-card .post-info-more {
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

          .post-card textarea {
            background: #efefef;
            padding: 0.75rem;
            font-size: 1rem;
            line-height: 1.2rem;
          }
        `}</style>
      </div>
    );
  }
}

PostCard.propTypes = {
  post: PropTypes.object,
  me: PropTypes.object,
  base_url: PropTypes.string,
  updatePostComments: PropTypes.any
};

export default PostCard;