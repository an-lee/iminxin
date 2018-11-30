import React from "react"
import PropTypes from "prop-types"
import api from '../libs/api';

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      ui: { pageInited: false }
    }
  }

  componentDidMount() {
    if (!this.state.ui.pageInited) {
      api.getPagesHome({
        success: (res) => {
          this.setState({
            ui: { pageInited: true }
          })
        }
      })
    }
  }

  render() {
    return (
      <div>
        { this.state.ui.pageInited ? 'pageInited!' : 'loading' }
      </div>
    );
  }
}

export default Home;
