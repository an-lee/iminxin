import React from "react";
import PropTypes from "prop-types";
import {
  Card, 
  WingBlank, 
  WhiteSpace, 
  Button
} from "antd-mobile";
import Avatar from "./components/Avatar";
import Logo from "./components/Logo";
import LoginModal from "./components/LoginModal";

class Intro extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      ui: {
        loginModal: false,
        payModal: false,
        reAuthModal: false
      }
    };
  }

  onClickEnter = () => {
    const me = this.props.me;
    const circle = this.props.circle;

    if (!me.is_logged_in) {
      console.log("loginModal");
      this.updateUI({
        loginModal: true
      });
    } else if (me.is_member) {
      console.log("redirect");
    } else if (circle.fee_limited) {
      console.log("pay for fee");
    } else if (me.holder_limited) {
      console.log("re-auth");
    }
  };

  onCloseLoginModal = () => {
    this.updateUI({
      loginModal: false
    });
  }

  updateUI = (ui) => {
    this.setState({
      ui: Object.assign({}, this.state.ui, ui)
    });
  }

  render() {
    const circle = this.props.circle;
    const FeeLimit = () => (
      circle.fee_limited && circle.fee_amount ? (
        `${circle.fee_amount}  ${circle.fee_currency.symbol}`
      ) : (
        "免费"
      )
    );
    const HolderLimit = () => (
      circle.holder_limited && circle.holder_limit_amount ? (
        `${circle.holder_limit_amount}  ${circle.holder_limit_currency.symbol}`
      ) : (
        "无门槛"
      )
    );

    return (
      <div>
        <WhiteSpace size="xl" />
        <div className="logo">
          <Logo src={circle.avatar_url} />
          <WhiteSpace size="xs" />
          {circle.name}
        </div>
        <style jsx>{`
            div.logo {
              text-align: center;
            }
          `}</style>
        <WhiteSpace size="xl" />

        <WingBlank size="lg">
          <WhiteSpace size="lg" />
          <Card>
            <Card.Body>
              <div>{circle.introduction}</div>
            </Card.Body>
            <WhiteSpace size="lg" />
            <Card.Footer 
              extra={
                <div>
                  <Avatar src={circle.owner.avatar_url}/>
                  <WhiteSpace size="xs" />
                  <span>{circle.owner.name}</span>
                </div>
              } 
            />
          </Card>
          <WhiteSpace size="lg" />
        </WingBlank>

        <WhiteSpace size="xl" />

        <div className="price">
          <div>
            入圈费用: <FeeLimit/>
          </div>
          <div>
            持仓门槛: <HolderLimit/>
          </div>
        </div>
        <style jsx>{`
            div.price {
              text-align: center;
            }
          `}</style>

        <WhiteSpace size="xl" />

        <WingBlank size="lg">
          <Button type="primary" onClick={this.onClickEnter}>进入</Button>
        </WingBlank>
        <style jsx global>{`
          body {
            margin: 0;
          }
        `}</style>

        <LoginModal visible={this.state.ui.loginModal} onClose={this.onCloseLoginModal} {...this.props} />
      </div>
    );
  }
}

Intro.propTypes = {
  circle: PropTypes.object,
  me: PropTypes.object
};

export default Intro;