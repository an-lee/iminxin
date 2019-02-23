import React from "react";
import PropTypes from "prop-types";
import Home from "./pages/Home";
import PostNew from "./pages/PostNew";
import Mine from "./pages/Mine";
import { TabBar, Modal } from "antd-mobile";

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedTab: "home"
    };
  }

  onSwitchTab = (tab) => {
    this.setState({selectedTab: tab});
  }

  render() {
    const iconStyle = (url) => {
      return {
        width: "30px",
        height: "30px",
        background: `url(${url}) center center /  28px 28px no-repeat`
      };
    };

    const iconSelectedStyle = (url) => {
      return {
        width: "32px",
        height: "32px",
        background: `url(${url}) center center /  30px 30px no-repeat`
      };
    };

    return (
      <div className="app">
        <TabBar
          unselectedTintColor="#949494"
          tintColor="#33A3F4"
          barTintColor="white"
        >
          <TabBar.Item
            key="home"
            icon={<div style={iconStyle("/circle/home.svg")}/>}
            selectedIcon={<div style={iconSelectedStyle("/circle/home_selected.svg")}/>}
            selected={this.state.selectedTab === "home"}
            onPress={() => this.onSwitchTab("home")}
            data-seed="logId"
          >
            <Home
              onSwitchTab={this.onSwitchTab}
              {...this.props} 
            />
          </TabBar.Item>

          <TabBar.Item
            key="new"
            icon={<div style={iconStyle("/circle/new.svg")}/>}
            selectedIcon={<div style={iconSelectedStyle("/circle/new_selected.svg")}/>}
            selected={this.state.selectedTab === "new"}
            onPress={() => this.onSwitchTab("new")}
          >
            <PostNew
              onSwitchTab={this.onSwitchTab}
              {...this.props}
            />
          </TabBar.Item>

          <TabBar.Item
            key="mine"
            icon={<div style={iconStyle("/circle/mine.svg")}/>}
            selectedIcon={<div style={iconSelectedStyle("/circle/mine_selected.svg")}/>}
            selected={this.state.selectedTab === "mine"}
            onPress={() => this.onSwitchTab("mine")}
          >
            <Mine
              onSwitchTab={this.onSwitchTab}
              {...this.props} 
            />
          </TabBar.Item>
        </TabBar>
        <style jsx>{`
          .app {
            position: fixed;
            height: 100%;
            width: 100%;
            top: 0
          }
        `}</style>
        <style jsx global>{`
          body {
            margin: 0;
            font-family: PingFang SC, miui, system-ui, -apple-system, BlinkMacSystemFont, Helvetica Neue, Helvetica, sans-serif;
            color: #495057;
            font-size: 0.9375rem;
          }
        `}</style>
      </div>
    );
  }
}

App.propTypes = {
  circle: PropTypes.object,
  me: PropTypes.object
};

export default App;