import React from "react";
import PropTypes from "prop-types";
import { 
  Toast
} from "antd-mobile";
import api from "../libs/api";
import PostCard from "../components/PostCard";

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: [],
      current_page: null
    };
    api.baseUrl = this.props.base_url;
  }

  updatePostComments = (postId, comments) => {
    const posts = this.state.posts;
    const index = posts.findIndex(post => post.id == postId);
    if (index > -1) {
      posts[index].comments = comments;
      this.setState({
        posts: posts
      });
    }
  }

  componentDidMount() {
    if (this.state.posts.length < 1) {
      Toast.loading("正在加载", 0);
      api.getPosts({
        current_page: this.state.current_page,
        success: (res) => {
          this.setState({
            posts: res.data.posts
          });
          Toast.hide();
        }
      });
    }
  }

  render() {
    const PostList = () => (
      this.state.posts.map((post) => (
        <PostCard key={post.id} post={post} base_url={this.props.base_url} updatePostComments={this.updatePostComments} />
      ))
    );

    return (
      <PostList />
    );
  }
}

Home.propTypes = {
  me: PropTypes.object,
  base_url: PropTypes.string
};

export default Home;