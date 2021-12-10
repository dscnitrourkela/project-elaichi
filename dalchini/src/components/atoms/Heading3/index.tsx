import React from 'react';
import './styles.scss';

const H3: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLHeadingElement>,
    HTMLHeadingElement
  >
> = ({ children }) => <h3 className="tertiary-heading">{children}</h3>;

export default H3;
