import React from "react"
import PropTypes from "prop-types"
import { withStyles } from '@material-ui/core/styles';
import BottomNavigation from '@material-ui/core/BottomNavigation';
import BottomNavigationAction from '@material-ui/core/BottomNavigationAction';
import Badge from '@material-ui/core/Badge';
import Icon from '@material-ui/core/Icon';
import HomeIcon from '@material-ui/icons/Home';
import ReorderIcon from '@material-ui/icons/Reorder';
import ShoppingCartIcon from '@material-ui/icons/ShoppingCart';
import PersonIcon from '@material-ui/icons/Person';

const styles = theme => ({
  badge: {
    top: 1,
    right: -15,
    // The border color match the background color.
    border: `2px solid ${
      theme.palette.type === 'light' ? theme.palette.grey[200] : theme.palette.grey[900]
    }`,
  },
});

class Home extends React.Component {
  state = {
    value: 'home',
  };

  handleChange = (event, value) => {
    this.setState({ value });
  };

  render() {
    const { value } = this.state;

    return (
      <BottomNavigation value={value} showLabels onChange={this.handleChange}>
        <BottomNavigationAction label="Home" value="home" icon={<HomeIcon />} />
        <BottomNavigationAction label="Category" value="category" icon={<ReorderIcon />} />
        <BottomNavigationAction
          label="Cart"
          value="cart"
          icon={
            <Badge badgeContent={4}
              color="primary"
              classes={{ badge: styles.badge }}>
              <ShoppingCartIcon />
            </Badge>} />
          <BottomNavigationAction label="Mine" value="mine" icon={<PersonIcon />} />
      </BottomNavigation>
    );
  }
}

export default withStyles(styles)(Home);
