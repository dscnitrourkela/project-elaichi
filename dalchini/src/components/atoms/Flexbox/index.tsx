import React from 'react';

// Libraries
import cx from 'classnames';

// Assets
import './styles.scss';

export interface FlexboxProps
  extends React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLDivElement>,
    HTMLDivElement
  > {
  flexColumn?: boolean;
  justifyStart?: boolean;
  justifyCenter?: boolean;
  justifyEnd?: boolean;
  justifyBetween?: boolean;
  justifyAround?: boolean;
  justifyEvenly?: boolean;
  alignStart?: boolean;
  alignCenter?: boolean;
  alignEnd?: boolean;
  flexWrap?: boolean;
  flexReverse?: boolean;
  className?: string;
}

const Flexbox: React.FC<FlexboxProps> = ({
  children,
  flexColumn,
  flexReverse,
  flexWrap,
  justifyStart,
  justifyCenter,
  justifyEnd,
  justifyAround,
  justifyBetween,
  justifyEvenly,
  alignStart,
  alignCenter,
  alignEnd,
  className
}) => (
  <div
    className={cx(
      flexColumn && 'flex-column',
      flexReverse && !flexColumn && 'flex-reverse-row',
      flexReverse && flexColumn && 'flex-reverse-column',
      flexWrap && 'flex-wrap',
      justifyStart && 'justify-start',
      justifyCenter && 'justify-center',
      justifyEnd && 'justify-end',
      justifyAround && 'justify-around',
      justifyBetween && 'justify-between',
      justifyEvenly && 'justify-evenly',
      alignStart && 'align-start',
      alignCenter && 'align-center',
      alignEnd && 'align-end',
      'flexbox',
      className
    )}
  >
    {children}
  </div>
);

export default Flexbox;
