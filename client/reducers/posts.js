import { FETCH_POSTS, FETCH_POST } from '../actions/index';


const INITIAL_STATE = []
export default function(state=INITIAL_STATE, action) {
    switch(action.type) {
	case 'CREATE_POST':
	    var posts = state;
	    var post = action.payload;
	    /* console.log("Created post " +  JSON.stringify(post));*/
	    /* console.log("Add created post to the stream " + JSON.stringify(post));*/
	    posts.unshift(post);
	    /* console.log("Updated posts " + JSON.stringify(posts));*/
	    return [...posts];
	case 'DELETE_POST':
	    var slug = action.payload;
	    var posts = state;
	    posts = posts.filter((p)=>{
		return p.slug !== slug;
	    });
	    return [...posts];
	case 'FETCH_POSTS':
	    var posts = action.payload
	    return posts;
	default:
	    return state;
    }
}
