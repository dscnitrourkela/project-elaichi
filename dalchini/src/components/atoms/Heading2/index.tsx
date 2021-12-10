import React from 'react';
import './styles.scss';

const H2: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLHeadingElement>,
    HTMLHeadingElement
  >
> = ({ children }) => <h2 className="secondary-heading">{children}</h2>;

export default H2;
