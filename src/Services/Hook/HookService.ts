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
    const actionService = new ActionService();
    this.githubEvent = event;

    try {
      // eslint-disable-next-line prefer-const
      let { eventType, ref, action } = this.githubEvent;
      if (this.githubEvent.pull_request && this.githubEvent.pull_request.base) {
        ref = this.githubEvent.pull_request.base.ref;
      }
      if (eventType === 'pull_request' && ref === 'main' && action === 'closed') {
        actionService.pull();
        console.log('Build on server finished');
      } else {
        console.log('No action taken');
      }
      return { hello: 'hello' };
    } catch (error) {
      console.error(error);
      return { error: 1, fullError: error };
    }
  }
}
