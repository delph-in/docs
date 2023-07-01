{% raw %}# Sample SMAF document

    <?xml version='1.0' encoding='UTF-8'?>
     <!DOCTYPE smaf SYSTEM 'smaf.dtd'>
     <smaf document='URL'>
      <text>OPTIONAL INLINE TEXT</text>
      <olac:olac xmlns:olac='http://www.language-archives.org/OLAC/1.0/' xmlns:dc='http://purl.org/dc/elements/1.1/'>
       <dc:creator>CREATOR</dc:creator>
       <created>TIMESTAMP</created>
       <dc:identifier>HOG-LIKE ID</dc:identifier>
       <!-- more OLAC metadata possible -->
      </olac:olac>
      <lattice init='v0' final='v89' cfrom='0' cto='100'>
    
       <!-- some simple tokens-->
       <edge type='token' id='t1' cfrom='0' cto='6' source='v0' target='v1'>
        <slot name='surface'>Andrew</slot>
       </edge>
       <edge type='token' id='t2' cfrom='7' cto='13' source='v0' target='v1'>
        <slot name='surface'>smiles</slot>
       </edge>
    
       <!-- part-of-speech -->
       <edge type='pos' id='p1' deps='t1' source='v0' target='v1'>
         <slot name='weight'>0.5</slot>
         <slot name='tagset'>CLAWS</slot>
         <slot name='tag'>NNP</slot>
       </edge>
    
       <!-- sample named entity -->
       <edge type='namedEntity' id='n1' cfrom='10' cto='20' source='v0' target='v1'>
        <slot name='weight'>0.567</slot>
        <slot name='surface'>1987 to 1997</slot>
        <fs type='timespan'>
           <f name='from'>
              <fs type='point'>
                <f name='year'>
                  <fs type='1987'/>
                </f>
              </fs>
           </f>
           <f name='to'>
              <fs type='point'>
                <f name='year'>
                  <fs type='1997'/>
                </f>
              </fs>
           </f>
         </fs>
         <!-- OR: could we use RMRS in place of above FS? -->
       </edge>
    
       <!-- ... -->
      </lattice>
     </smaf>

Last update: 2006-03-03 by BenjaminWaldron [[edit](https://github.com/delph-in/docs/wiki/SmafSample/_edit)]{% endraw %}