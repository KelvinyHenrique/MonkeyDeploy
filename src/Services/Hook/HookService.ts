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
    const action = new ActionService();
    this.githubEvent = event;
    try {
      if (
        this.githubEvent
        && this.githubEvent.eventType === 'pull_request'
        && this.githubEvent.ref === 'refs/heads/feature/1453-Redesign'
      ) {
        action.pull();
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
