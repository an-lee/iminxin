import React from "react";
import PropTypes from "prop-types";
import { NavBar, Card, WingBlank, WhiteSpace, Icon } from "antd-mobile";
import "./App.less";

class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      circle: props.circle,
      me: props.me
    };
  }

  componentDidMount() {
    if (this.state.me.is_member) {
      console.log("redirect");
    }
  }

  render() {
    const circle = this.props.circle;
    const Logo = () => (
      <img 
        src={ circle.avatar_url } 
        style={ { width: "2rem", height: "2rem", marginRight: "0.5rem" } }
      />
    );

    return (
      <div>
        <NavBar
          mode="light"
        >
          <Logo />
          { circle.name }
        </NavBar>

        <WhiteSpace size="xl" />

        <WingBlank size="lg">
          <WhiteSpace size="lg" />
          <Card>
            <Card.Body>
              <div>{circle.introduction}</div>
            </Card.Body>
            <Card.Footer content="footer content" extra={<div>extra footer content</div>} />
          </Card>
          <WhiteSpace size="lg" />
        </WingBlank>
      </div>

      
    );
  }
}

App.propTypes = {
  circle: PropTypes.object,
  me: PropTypes.object
};

export default App;