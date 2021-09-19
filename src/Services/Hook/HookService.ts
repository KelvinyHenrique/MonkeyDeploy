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
      if (this.githubEvent.base && this.githubEvent.base.ref) {
        ref = this.githubEvent.base.ref;
      }
      console.log(`Event Type: ${eventType}`);
      console.log(`Ref: ${ref}`);
      console.log(`Action: ${action}`);
      if (eventType === 'pull_request' && ref === 'refs/heads/main' && action === 'closed') {
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
