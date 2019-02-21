import React from "react";
import PropTypes from "prop-types";
import { withStyles } from "@material-ui/core/styles";
import AppBar from "@material-ui/core/AppBar";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import HomeIcon from "@material-ui/icons/Home";
import ReorderIcon from "@material-ui/icons/Reorder";
import PersonPinIcon from "@material-ui/icons/PersonPin";
import ShoppingBasketIcon from "@material-ui/icons/ShoppingBasket";
import Typography from "@material-ui/core/Typography";
import Home from "./pages/home";
import Category from "./pages/category";
import Cart from "./pages/cart";
import Mine from "./pages/mine";

function TabContainer(props) {
  return (
    <Typography component="div" style={{ padding: 8 * 3 }}>
      {props.children}
    </Typography>
  );
}

TabContainer.propTypes = {
  children: PropTypes.node.isRequired,
};

const styles = theme => ({
  root: {
    flexGrow: 1,
    width: "100%",
    backgroundColor: theme.palette.background.paper,
  },
});

class App extends React.Component {
  state = {
    value: 0,
  };

  handleChange = (event, value) => {
    this.setState({ value });
  };

  render() {
    const { classes } = this.props;
    const { value } = this.state;

    return (
      <div className={classes.root}>
        <AppBar position="sticky">
          <Tabs value={value} onChange={this.handleChange} centered fullWidth>
            <Tab icon={<HomeIcon />} />
            <Tab icon={<ReorderIcon />} />
            <Tab icon={<ShoppingBasketIcon />} />
            <Tab icon={<PersonPinIcon />} />
          </Tabs>
        </AppBar>
        {value === 0 && <TabContainer><Home /></TabContainer>}
        {value === 1 && <TabContainer><Category /></TabContainer>}
        {value === 2 && <TabContainer><Cart /></TabContainer>}
        {value === 3 && <TabContainer><Mine /></TabContainer>}
      </div>
    );
  }
}

App.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(App);
