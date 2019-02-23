import React from "react";
import PropTypes from "prop-types";
import { 
  Modal, 
  Button,
  WingBlank, 
  WhiteSpace
} from "antd-mobile";
import api from "../libs/api";

class LoginModal extends React.Component {
  constructor(props) {
    super(props);
    api.baseUrl = this.props.baseUrl;
  }

  onLogin = () => {
    // window.location.href = "login";
    api.login;
  }

  render() {
    return (
      <Modal
        popup
        visible={this.props.visible}
        onClose={this.props.onClose}
        title="登录"
        animationType="slide-up"
      >
        <WingBlank>
          将使用 Mixin Messenger 登录
          <WhiteSpace/>
          <Button type="primary" onClick={this.onLogin}>确认登录</Button>
          <WhiteSpace size="xl" />
        </WingBlank>
      </Modal>
    );
  }
}

LoginModal.propTypes = {
  baseUrl: PropTypes.string,
  visible: PropTypes.bool.isRequired,
  onClose: PropTypes.function
};

export default LoginModal;