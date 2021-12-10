import React from 'react';
import './styles.scss';

const P2: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLSpanElement>,
    HTMLSpanElement
  >
> = ({ children }) => <span className="highlight-text">{children}</span>;

export default P2;
