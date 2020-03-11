import { combineReducers } from 'redux';
import usersReducer from './users_reducer';
import attractionsReducer from './attractions_reducer';
import reviewsReducer from './reviews_reducer';

export default combineReducers({
    users: usersReducer,
    attractions: attractionsReducer,
    reviews: reviewsReducer,
});