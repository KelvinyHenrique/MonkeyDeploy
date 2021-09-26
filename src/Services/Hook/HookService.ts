import ActionService from '../ActionService';
import isset from '../../global/isset';

export default class HookService {
  data: any;

  eventType: string;

  githubEvent: any;

  parsedData: any;

  constructor() {
    this.data = {};
    this.githubEvent = {};
    this.parsedData = {};
    this.eventType = '';
  }

  github(event: any) {
    /* const actionService = new ActionService(); tT */

    try {
      const hook = this.parseGithubEvent(event);
      console.log(hook);
      return { hello: 'hello' };
    } catch (error) {
      console.error(error);
      return { error: 1, fullError: error };
    }
  }

  // eslint-disable-next-line class-methods-use-this
  parseGithubEvent(event: any) {
    const sender = this.getSenderData(event);
    const repositoryData = this.getRepositoryData(event);

    const data = {
      eventType: event.eventType || 'unrecognized',
      ...repositoryData,
      action: event.action || event.eventType,
      ...sender,
    };

    return data;
  }

  // eslint-disable-next-line class-methods-use-this
  getRepositoryData(event: any) {
    const data = {
      id: null,
      name: null,
      url: null,
      branch: null,
    };

    if (event.repository) {
      const { repository } = event;
      if (repository.id) {
        data.id = repository.id;
      }
      if (repository.name) {
        data.name = repository.name;
      }
      if (repository.url) {
        data.url = repository.url;
      }
      if (event.ref) {
        data.branch = event.ref;
      } else if (event.pull_request) {
        data.branch = event.pull_request.base.ref;
      }
    }
    return data;
  }

  // eslint-disable-next-line class-methods-use-this
  getSenderData(event: any) {
    const data = { username: null, id: null, type: null };
    if (isset(event.sender)) {
      if (isset(event.sender.login)) {
        data.username = event.sender.login;
      }
      if (isset(event.sender.id)) {
        data.id = event.sender.id;
      }
      if (isset(event.sender.type)) {
        data.type = event.sender.type;
      }
    } else {
      return data;
    }
    return data;
  }
}
