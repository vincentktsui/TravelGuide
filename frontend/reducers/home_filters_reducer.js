import { UPDATE_HOME_FILTER } from '../actions/filter_actions';

const homeFiltersReducer = (state = { bounds: {} }, action) => {
    Object.freeze(state);
    let newState = Object.assign({}, state);

    switch (action.type) {
        // case UPDATE_BOUNDS:
        //     newState = Object.assign({}, state, {bounds: action.bounds});
        //     return newState;
        case UPDATE_HOME_FILTER:
            newState[action.filter] = action.value;
            return newState;
        default:
            return state;
    }
};

export default homeFiltersReducer;