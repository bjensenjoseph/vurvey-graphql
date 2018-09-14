const getUserInfo = () => ({ name: 'Brad' }) fetch(config.userEndpoint);
const getPaginatedTweets = () => null;

import config from './config.json'

export const resolvers = {
  Query: {
    getUserInfo: (root, args) => getUserInfo(args),
  },
  User: {
    tweets: (obj, args) => getPaginatedTweets(obj.handle, args),
  },
};
