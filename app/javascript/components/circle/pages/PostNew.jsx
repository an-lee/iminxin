import React from "react";
import PropTypes from "prop-types";
import { 
  WhiteSpace,
  WingBlank,
  List,
  TextareaItem,
  Button,
  Toast
} from "antd-mobile";
import api from "../libs/api";

class PostNew extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      content: "",
      ui: {
        submiting: false
      }
    };
    api.baseUrl = this.props.base_url;
  }

  onContentChange = (content) => {
    this.setState({
      content: content
    });
  }

  onSubmit = () => {
    if (this.state.ui.submiting) return;

    Toast.loading("正在提交", 0);
    api.createPost({
      data: {
        content: this.state.content
      },
      fail: () => {
        Toast.fail("出错了，请稍后重试", 1);
      },
      success: () => {
        this.setState({
          content: ""
        });
        Toast.success("成功发布", 1);
      },
      complete: () => {
        this.updateUI({submiting: false});
        this.props.onSwitchTab("home");
      }
    });
  }

  updateUI = (ui) => {
    this.setState({
      ui: Object.assign({}, this.state.ui, ui)
    });
  }

  render() {
    return (
      <div className="mineTab">
        <List renderHeader={() => "内容"}>
          <TextareaItem
            rows={7}
            autoHeight
            clear
            placeholder="分享些什么吧"
            value={this.state.content}
            onChange={this.onContentChange}
          />
        </List>
        <WhiteSpace size="xl" />
        <WingBlank>
          <Button disabled={this.state.content.length < 1} type="primary" onClick={this.onSubmit}>发布</Button>
        </WingBlank>
      </div>
    );
  }
}

PostNew.propTypes = {
  me: PropTypes.object,
  base_url: PropTypes.string,
  onSwitchTab: PropTypes.any
};

export default PostNew;