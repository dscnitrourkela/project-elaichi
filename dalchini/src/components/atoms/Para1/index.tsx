import React from 'react';
import './styles.scss';

const P1: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLParagraphElement>,
    HTMLParagraphElement
  >
> = ({ children }) => <p className="primary-para">{children}</p>;

export default P1;
