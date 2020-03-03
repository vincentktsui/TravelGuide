import { connect } from 'react-redux';
import NavBar from './nav_bar';
import { logout } from '../actions/session_actions';
import { withRouter } from 'react-router-dom';


const mapStateToProps = ({ entities, session }) => ({
    currentUser: entities.users[session.id],
});

const mapDispatchToProps = dispatch => ({
    logout: () => dispatch(logout()),
});

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(NavBar));