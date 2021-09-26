import ActionService from '../ActionService';

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
      this.parseGithubEvent(event);
      return { hello: 'hello' };
    } catch (error) {
      console.error(error);
      return { error: 1, fullError: error };
    }
  }

  // eslint-disable-next-line class-methods-use-this
  parseGithubEvent(event: any) {
    console.log(event);
    return event;
  }
}
