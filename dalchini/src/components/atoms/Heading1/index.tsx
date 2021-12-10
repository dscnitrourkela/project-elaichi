import React from 'react';
import './styles.scss';

const H1: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLHeadingElement>,
    HTMLHeadingElement
  >
> = ({ children }) => <h1 className="primary-heading">{children}</h1>;

export default H1;
