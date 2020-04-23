import React from 'react';
import * as APIUtil from '../../util/hotel_api_util';
import { fetchHotels } from '../../actions/hotel_actions';

class CityHome extends React.Component {
    constructor(props) {
        super(props);
        this.props = props;
    }

    componentDidMount() {
        this.props.updateFilter("city", this.city);
        this.props.fetchAttractions(this.props.filters);
        this.props.fetchHotels();
        const splash = document.querySelector('.city-splash');
        splash.style.backgroundImage = `url(${localStorage.cityPhoto})`;
    }

    componentDidUpdate(prevProps) {
        if (prevProps.match.params !== this.props.match.params) {
            const splash = document.querySelector('.city-splash');
            splash.style.backgroundImage = `url(${localStorage.cityPhoto})`;
        }
    }

    render() {
        return(
            <div className="city-splash">
                <h1>{localStorage.city}</h1>
                <nav>
                    <button>Attractions</button>
                    <button>Hotels</button>
                </nav>
            </div>
        )
    }
}

export default CityHome;