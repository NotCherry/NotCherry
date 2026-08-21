import { useState } from 'react';

type Thread = {
  index: string;
  label: string;
  title: string;
  summary: string;
  stack: string[];
  status: string;
};

const threads: Thread[] = [
  {
    index: '01',
    label: 'CURRENT DIRECTION',
    title: 'Robot-learning education',
    summary:
      'A simple learning space for students and less experienced builders to imagine tasks for URDF robots.',
    stack: ['Python', 'URDF', 'MuJoCo', 'skrl'],
    status: 'Idea taking shape',
  },
  {
    index: '02',
    label: 'LEARNING THREAD',
    title: 'Unitree G1 exploration',
    summary:
      'An honest record of trying to make a humanoid robot stand and walk while learning where reinforcement learning gets difficult.',
    stack: ['Unitree G1', 'MuJoCo', 'skrl', 'RL'],
    status: 'Private exploration',
  },
  {
    index: '03',
    label: 'SYSTEMS BACKGROUND',
    title: 'Learning by keeping things running',
    summary:
      'Years of Linux and Windows, game-server hosting, terminal tools, Docker, and small systems experiments built practical instincts.',
    stack: ['Linux', 'Windows', 'Docker', 'Vim'],
    status: 'Long-running thread',
  },
];

export default function ThreadNavigator() {
  const [activeIndex, setActiveIndex] = useState(0);
  const activeThread = threads[activeIndex];

  return (
    <div className="thread-navigator">
      <div className="thread-list" role="tablist" aria-label="Learning threads">
        {threads.map((thread, index) => (
          <button
            className={`thread-tab${index === activeIndex ? ' is-active' : ''}`}
            key={thread.index}
            type="button"
            role="tab"
            aria-selected={index === activeIndex}
            aria-controls={`thread-panel-${thread.index}`}
            id={`thread-tab-${thread.index}`}
            onClick={() => setActiveIndex(index)}
          >
            <span>{thread.index}</span>
            <span>{thread.label}</span>
          </button>
        ))}
      </div>

      <article
        className="thread-panel"
        role="tabpanel"
        id={`thread-panel-${activeThread.index}`}
        aria-labelledby={`thread-tab-${activeThread.index}`}
      >
        <div className="thread-panel__topline">
          <span>{activeThread.status}</span>
          <span aria-hidden="true">↗</span>
        </div>
        <h3>{activeThread.title}</h3>
        <p>{activeThread.summary}</p>
        <ul className="tag-list" aria-label="Technologies and topics">
          {activeThread.stack.map((item) => (
            <li key={item}>{item}</li>
          ))}
        </ul>
      </article>
    </div>
  );
}
