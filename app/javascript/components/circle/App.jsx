import React from "react";
import PropTypes from "prop-types";
import Home from "./pages/Home";
import PostNew from "./pages/PostNew";
import Mine from "./pages/Mine";
import { TabBar } from "antd-mobile";
import { Home as HomeIcon, User as UserIcon, PlusCircle as PlusCircleIcon } from "react-feather";

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
    return (
      <div className="app">
        <TabBar
          unselectedTintColor="#949494"
          tintColor="#33A3F4"
          barTintColor="white"
        >
          <TabBar.Item
            key="home"
            title="圈子"
            icon={<HomeIcon size={22}/>}
            selectedIcon={<HomeIcon size={22}/>}
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
            title="分享"
            icon={<PlusCircleIcon size={22}/>}
            selectedIcon={<PlusCircleIcon size={22}/>}
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
            title="我的"
            icon={<UserIcon size={22}/>}
            selectedIcon={<UserIcon size={22}/>}
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