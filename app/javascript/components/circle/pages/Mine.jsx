import React from "react";
import Avatar from "../components/Avatar";
import PropTypes from "prop-types";
import { 
  WhiteSpace,
  List,
  Modal
} from "antd-mobile";
import api from "../libs/api";

const alert = Modal.alert;

class Mine extends React.Component {
  constructor(props) {
    super(props);
    api.baseUrl = this.props.base_url;
  }

  onLogout = () => {
    alert("注销", "你将注销当前登录状态", [
      { text: "取消" },
      { text: "确认", onPress: () => {api.logout();} },
    ]);
  }

  render() {
    const me = this.props.me;

    return (
      <div className="mineTab">
        <WhiteSpace size="xl" />
        <div className="avatar-section">
          <Avatar src={me.avatar_url} size="md" />
          <WhiteSpace size="md" />
          {me.name}
        </div>
        <style jsx>{`
          .avatar-section {
            text-align: center;
          }
        `}</style>
        <WhiteSpace size="xl" />
        <List className="my-list">
          <List.Item  extra={me.posts_count}>我的帖子</List.Item>
        </List>
        <WhiteSpace size="xl" />
        <List className="my-list">
          <List.Item arrow="horizontal" onClick={this.onLogout}>退出登录</List.Item>
        </List>
      </div>
    );
  }
}

Mine.propTypes = {
  me: PropTypes.object,
  base_url: PropTypes.string
};

export default Mine;