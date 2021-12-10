import React from 'react';
import './styles.scss';

const P2: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLParagraphElement>,
    HTMLParagraphElement
  >
> = ({ children }) => <p className="secondary-para">{children}</p>;

export default P2;
