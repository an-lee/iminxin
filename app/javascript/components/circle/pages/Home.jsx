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
        <PostCard key={post.id} post={post} />
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