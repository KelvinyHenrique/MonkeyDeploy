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
      const { eventType, ref, action } = this.githubEvent;
      console.log(`Event Type: ${eventType}`);
      console.log(`Ref: ${ref}`);
      console.log(`Action: ${action}`);
      if (eventType === 'pull_request' && ref === 'refs/heads/main' && action === 'closed') {
        actionService.pull();
        console.log('Build on server finished');
      } else {
        console.log('Not action');
      }
      return { hello: 'hello' };
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }
}
